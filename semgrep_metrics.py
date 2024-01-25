"""Generated by atdpy from type definitions in semgrep_metrics.atd.

This implements classes for the types defined in 'semgrep_metrics.atd', providing
methods and functions to convert data from/to JSON.
"""

# Disable flake8 entirely on this file:
# flake8: noqa

# Import annotations to allow forward references
from __future__ import annotations
from dataclasses import dataclass, field
from typing import Any, Callable, Dict, List, NoReturn, Optional, Tuple, Union

import json

############################################################################
# Private functions
############################################################################


def _atd_missing_json_field(type_name: str, json_field_name: str) -> NoReturn:
    raise ValueError(f"missing field '{json_field_name}'"
                     f" in JSON object of type '{type_name}'")


def _atd_bad_json(expected_type: str, json_value: Any) -> NoReturn:
    value_str = str(json_value)
    if len(value_str) > 200:
        value_str = value_str[:200] + '…'

    raise ValueError(f"incompatible JSON value where"
                     f" type '{expected_type}' was expected: '{value_str}'")


def _atd_bad_python(expected_type: str, json_value: Any) -> NoReturn:
    value_str = str(json_value)
    if len(value_str) > 200:
        value_str = value_str[:200] + '…'

    raise ValueError(f"incompatible Python value where"
                     f" type '{expected_type}' was expected: '{value_str}'")


def _atd_read_unit(x: Any) -> None:
    if x is None:
        return x
    else:
        _atd_bad_json('unit', x)


def _atd_read_bool(x: Any) -> bool:
    if isinstance(x, bool):
        return x
    else:
        _atd_bad_json('bool', x)


def _atd_read_int(x: Any) -> int:
    if isinstance(x, int):
        return x
    else:
        _atd_bad_json('int', x)


def _atd_read_float(x: Any) -> float:
    if isinstance(x, (int, float)):
        return x
    else:
        _atd_bad_json('float', x)


def _atd_read_string(x: Any) -> str:
    if isinstance(x, str):
        return x
    else:
        _atd_bad_json('str', x)


def _atd_read_list(
            read_elt: Callable[[Any], Any]
        ) -> Callable[[List[Any]], List[Any]]:
    def read_list(elts: List[Any]) -> List[Any]:
        if isinstance(elts, list):
            return [read_elt(elt) for elt in elts]
        else:
            _atd_bad_json('array', elts)
    return read_list


def _atd_read_assoc_array_into_dict(
            read_key: Callable[[Any], Any],
            read_value: Callable[[Any], Any],
        ) -> Callable[[List[Any]], Dict[Any, Any]]:
    def read_assoc(elts: List[List[Any]]) -> Dict[str, Any]:
        if isinstance(elts, list):
            return {read_key(elt[0]): read_value(elt[1]) for elt in elts}
        else:
            _atd_bad_json('array', elts)
            raise AssertionError('impossible')  # keep mypy happy
    return read_assoc


def _atd_read_assoc_object_into_dict(
            read_value: Callable[[Any], Any]
        ) -> Callable[[Dict[str, Any]], Dict[str, Any]]:
    def read_assoc(elts: Dict[str, Any]) -> Dict[str, Any]:
        if isinstance(elts, dict):
            return {_atd_read_string(k): read_value(v)
                    for k, v in elts.items()}
        else:
            _atd_bad_json('object', elts)
            raise AssertionError('impossible')  # keep mypy happy
    return read_assoc


def _atd_read_assoc_object_into_list(
            read_value: Callable[[Any], Any]
        ) -> Callable[[Dict[str, Any]], List[Tuple[str, Any]]]:
    def read_assoc(elts: Dict[str, Any]) -> List[Tuple[str, Any]]:
        if isinstance(elts, dict):
            return [(_atd_read_string(k), read_value(v))
                    for k, v in elts.items()]
        else:
            _atd_bad_json('object', elts)
            raise AssertionError('impossible')  # keep mypy happy
    return read_assoc


def _atd_read_nullable(read_elt: Callable[[Any], Any]) \
        -> Callable[[Optional[Any]], Optional[Any]]:
    def read_nullable(x: Any) -> Any:
        if x is None:
            return None
        else:
            return read_elt(x)
    return read_nullable


def _atd_read_option(read_elt: Callable[[Any], Any]) \
        -> Callable[[Optional[Any]], Optional[Any]]:
    def read_option(x: Any) -> Any:
        if x == 'None':
            return None
        elif isinstance(x, List) and len(x) == 2 and x[0] == 'Some':
            return read_elt(x[1])
        else:
            _atd_bad_json('option', x)
            raise AssertionError('impossible')  # keep mypy happy
    return read_option


def _atd_write_unit(x: Any) -> None:
    if x is None:
        return x
    else:
        _atd_bad_python('unit', x)


def _atd_write_bool(x: Any) -> bool:
    if isinstance(x, bool):
        return x
    else:
        _atd_bad_python('bool', x)


def _atd_write_int(x: Any) -> int:
    if isinstance(x, int):
        return x
    else:
        _atd_bad_python('int', x)


def _atd_write_float(x: Any) -> float:
    if isinstance(x, (int, float)):
        return x
    else:
        _atd_bad_python('float', x)


def _atd_write_string(x: Any) -> str:
    if isinstance(x, str):
        return x
    else:
        _atd_bad_python('str', x)


def _atd_write_list(
            write_elt: Callable[[Any], Any]
        ) -> Callable[[List[Any]], List[Any]]:
    def write_list(elts: List[Any]) -> List[Any]:
        if isinstance(elts, list):
            return [write_elt(elt) for elt in elts]
        else:
            _atd_bad_python('list', elts)
    return write_list


def _atd_write_assoc_dict_to_array(
            write_key: Callable[[Any], Any],
            write_value: Callable[[Any], Any]
        ) -> Callable[[Dict[Any, Any]], List[Tuple[Any, Any]]]:
    def write_assoc(elts: Dict[str, Any]) -> List[Tuple[str, Any]]:
        if isinstance(elts, dict):
            return [(write_key(k), write_value(v)) for k, v in elts.items()]
        else:
            _atd_bad_python('Dict[str, <value type>]]', elts)
            raise AssertionError('impossible')  # keep mypy happy
    return write_assoc


def _atd_write_assoc_dict_to_object(
            write_value: Callable[[Any], Any]
        ) -> Callable[[Dict[str, Any]], Dict[str, Any]]:
    def write_assoc(elts: Dict[str, Any]) -> Dict[str, Any]:
        if isinstance(elts, dict):
            return {_atd_write_string(k): write_value(v)
                    for k, v in elts.items()}
        else:
            _atd_bad_python('Dict[str, <value type>]', elts)
            raise AssertionError('impossible')  # keep mypy happy
    return write_assoc


def _atd_write_assoc_list_to_object(
            write_value: Callable[[Any], Any],
        ) -> Callable[[List[Any]], Dict[str, Any]]:
    def write_assoc(elts: List[List[Any]]) -> Dict[str, Any]:
        if isinstance(elts, list):
            return {_atd_write_string(elt[0]): write_value(elt[1])
                    for elt in elts}
        else:
            _atd_bad_python('List[Tuple[<key type>, <value type>]]', elts)
            raise AssertionError('impossible')  # keep mypy happy
    return write_assoc


def _atd_write_nullable(write_elt: Callable[[Any], Any]) \
        -> Callable[[Optional[Any]], Optional[Any]]:
    def write_nullable(x: Any) -> Any:
        if x is None:
            return None
        else:
            return write_elt(x)
    return write_nullable


def _atd_write_option(write_elt: Callable[[Any], Any]) \
        -> Callable[[Optional[Any]], Optional[Any]]:
    def write_option(x: Any) -> Any:
        if x is None:
            return 'None'
        else:
            return ['Some', write_elt(x)]
    return write_option


############################################################################
# Public classes
############################################################################


from dataclasses import field


@dataclass
class Uuid:
    """Original type: uuid"""

    value: str

    @classmethod
    def from_json(cls, x: Any) -> 'Uuid':
        return cls(_atd_read_string(x))

    def to_json(self) -> Any:
        return _atd_write_string(self.value)

    @classmethod
    def from_json_string(cls, x: str) -> 'Uuid':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class SupplyChainConfig:
    """Original type: supply_chain_config = { ... }"""

    _rfu: Optional[int] = None

    @classmethod
    def from_json(cls, x: Any) -> 'SupplyChainConfig':
        if isinstance(x, dict):
            return cls(
                _rfu=_atd_read_int(x['_rfu']) if '_rfu' in x else None,
            )
        else:
            _atd_bad_json('SupplyChainConfig', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        if self._rfu is not None:
            res['_rfu'] = _atd_write_int(self._rfu)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'SupplyChainConfig':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Sha256:
    """Original type: sha256"""

    value: str

    @classmethod
    def from_json(cls, x: Any) -> 'Sha256':
        return cls(_atd_read_string(x))

    def to_json(self) -> Any:
        return _atd_write_string(self.value)

    @classmethod
    def from_json_string(cls, x: str) -> 'Sha256':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Any_:
    """Original type: secrets_origin = [ ... | Any | ... ]"""

    @property
    def kind(self) -> str:
        """Name of the class representing this variant."""
        return 'Any_'

    @staticmethod
    def to_json() -> Any:
        return 'Any'

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Semgrep:
    """Original type: secrets_origin = [ ... | Semgrep | ... ]"""

    @property
    def kind(self) -> str:
        """Name of the class representing this variant."""
        return 'Semgrep'

    @staticmethod
    def to_json() -> Any:
        return 'Semgrep'

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class SecretsOrigin:
    """Original type: secrets_origin = [ ... ]"""

    value: Union[Any_, Semgrep]

    @property
    def kind(self) -> str:
        """Name of the class representing this variant."""
        return self.value.kind

    @classmethod
    def from_json(cls, x: Any) -> 'SecretsOrigin':
        if isinstance(x, str):
            if x == 'Any':
                return cls(Any_())
            if x == 'Semgrep':
                return cls(Semgrep())
            _atd_bad_json('SecretsOrigin', x)
        _atd_bad_json('SecretsOrigin', x)

    def to_json(self) -> Any:
        return self.value.to_json()

    @classmethod
    def from_json_string(cls, x: str) -> 'SecretsOrigin':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class SecretsConfig:
    """Original type: secrets_config = { ... }"""

    permitted_origins: SecretsOrigin

    @classmethod
    def from_json(cls, x: Any) -> 'SecretsConfig':
        if isinstance(x, dict):
            return cls(
                permitted_origins=SecretsOrigin.from_json(x['permitted_origins']) if 'permitted_origins' in x else _atd_missing_json_field('SecretsConfig', 'permitted_origins'),
            )
        else:
            _atd_bad_json('SecretsConfig', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        res['permitted_origins'] = (lambda x: x.to_json())(self.permitted_origins)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'SecretsConfig':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class RuleStats:
    """Original type: rule_stats = { ... }"""

    ruleHash: str
    bytesScanned: int
    matchTime: Optional[float] = None

    @classmethod
    def from_json(cls, x: Any) -> 'RuleStats':
        if isinstance(x, dict):
            return cls(
                ruleHash=_atd_read_string(x['ruleHash']) if 'ruleHash' in x else _atd_missing_json_field('RuleStats', 'ruleHash'),
                bytesScanned=_atd_read_int(x['bytesScanned']) if 'bytesScanned' in x else _atd_missing_json_field('RuleStats', 'bytesScanned'),
                matchTime=_atd_read_float(x['matchTime']) if 'matchTime' in x else None,
            )
        else:
            _atd_bad_json('RuleStats', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        res['ruleHash'] = _atd_write_string(self.ruleHash)
        res['bytesScanned'] = _atd_write_int(self.bytesScanned)
        if self.matchTime is not None:
            res['matchTime'] = _atd_write_float(self.matchTime)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'RuleStats':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class ProFeatures:
    """Original type: pro_features = { ... }"""

    diffDepth: Optional[int] = None

    @classmethod
    def from_json(cls, x: Any) -> 'ProFeatures':
        if isinstance(x, dict):
            return cls(
                diffDepth=_atd_read_int(x['diffDepth']) if 'diffDepth' in x else None,
            )
        else:
            _atd_bad_json('ProFeatures', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        if self.diffDepth is not None:
            res['diffDepth'] = _atd_write_int(self.diffDepth)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'ProFeatures':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class FileStats:
    """Original type: file_stats = { ... }"""

    size: int
    numTimesScanned: int
    parseTime: Optional[float] = None
    matchTime: Optional[float] = None
    runTime: Optional[float] = None

    @classmethod
    def from_json(cls, x: Any) -> 'FileStats':
        if isinstance(x, dict):
            return cls(
                size=_atd_read_int(x['size']) if 'size' in x else _atd_missing_json_field('FileStats', 'size'),
                numTimesScanned=_atd_read_int(x['numTimesScanned']) if 'numTimesScanned' in x else _atd_missing_json_field('FileStats', 'numTimesScanned'),
                parseTime=_atd_read_float(x['parseTime']) if 'parseTime' in x else None,
                matchTime=_atd_read_float(x['matchTime']) if 'matchTime' in x else None,
                runTime=_atd_read_float(x['runTime']) if 'runTime' in x else None,
            )
        else:
            _atd_bad_json('FileStats', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        res['size'] = _atd_write_int(self.size)
        res['numTimesScanned'] = _atd_write_int(self.numTimesScanned)
        if self.parseTime is not None:
            res['parseTime'] = _atd_write_float(self.parseTime)
        if self.matchTime is not None:
            res['matchTime'] = _atd_write_float(self.matchTime)
        if self.runTime is not None:
            res['runTime'] = _atd_write_float(self.runTime)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'FileStats':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Performance:
    """Original type: performance = { ... }"""

    numRules: Optional[int] = None
    numTargets: Optional[int] = None
    totalBytesScanned: Optional[int] = None
    fileStats: Optional[List[FileStats]] = None
    ruleStats: Optional[List[RuleStats]] = None
    profilingTimes: Optional[List[Tuple[str, float]]] = None
    maxMemoryBytes: Optional[int] = None

    @classmethod
    def from_json(cls, x: Any) -> 'Performance':
        if isinstance(x, dict):
            return cls(
                numRules=_atd_read_int(x['numRules']) if 'numRules' in x else None,
                numTargets=_atd_read_int(x['numTargets']) if 'numTargets' in x else None,
                totalBytesScanned=_atd_read_int(x['totalBytesScanned']) if 'totalBytesScanned' in x else None,
                fileStats=_atd_read_list(FileStats.from_json)(x['fileStats']) if 'fileStats' in x else None,
                ruleStats=_atd_read_list(RuleStats.from_json)(x['ruleStats']) if 'ruleStats' in x else None,
                profilingTimes=_atd_read_assoc_object_into_list(_atd_read_float)(x['profilingTimes']) if 'profilingTimes' in x else None,
                maxMemoryBytes=_atd_read_int(x['maxMemoryBytes']) if 'maxMemoryBytes' in x else None,
            )
        else:
            _atd_bad_json('Performance', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        if self.numRules is not None:
            res['numRules'] = _atd_write_int(self.numRules)
        if self.numTargets is not None:
            res['numTargets'] = _atd_write_int(self.numTargets)
        if self.totalBytesScanned is not None:
            res['totalBytesScanned'] = _atd_write_int(self.totalBytesScanned)
        if self.fileStats is not None:
            res['fileStats'] = _atd_write_list((lambda x: x.to_json()))(self.fileStats)
        if self.ruleStats is not None:
            res['ruleStats'] = _atd_write_list((lambda x: x.to_json()))(self.ruleStats)
        if self.profilingTimes is not None:
            res['profilingTimes'] = _atd_write_assoc_list_to_object(_atd_write_float)(self.profilingTimes)
        if self.maxMemoryBytes is not None:
            res['maxMemoryBytes'] = _atd_write_int(self.maxMemoryBytes)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'Performance':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class ParseStat:
    """Original type: parse_stat = { ... }"""

    targets_parsed: int
    num_targets: int
    bytes_parsed: int
    num_bytes: int

    @classmethod
    def from_json(cls, x: Any) -> 'ParseStat':
        if isinstance(x, dict):
            return cls(
                targets_parsed=_atd_read_int(x['targets_parsed']) if 'targets_parsed' in x else _atd_missing_json_field('ParseStat', 'targets_parsed'),
                num_targets=_atd_read_int(x['num_targets']) if 'num_targets' in x else _atd_missing_json_field('ParseStat', 'num_targets'),
                bytes_parsed=_atd_read_int(x['bytes_parsed']) if 'bytes_parsed' in x else _atd_missing_json_field('ParseStat', 'bytes_parsed'),
                num_bytes=_atd_read_int(x['num_bytes']) if 'num_bytes' in x else _atd_missing_json_field('ParseStat', 'num_bytes'),
            )
        else:
            _atd_bad_json('ParseStat', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        res['targets_parsed'] = _atd_write_int(self.targets_parsed)
        res['num_targets'] = _atd_write_int(self.num_targets)
        res['bytes_parsed'] = _atd_write_int(self.bytes_parsed)
        res['num_bytes'] = _atd_write_int(self.num_bytes)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'ParseStat':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class CodeConfig:
    """Original type: code_config = { ... }"""

    _rfu: Optional[int] = None

    @classmethod
    def from_json(cls, x: Any) -> 'CodeConfig':
        if isinstance(x, dict):
            return cls(
                _rfu=_atd_read_int(x['_rfu']) if '_rfu' in x else None,
            )
        else:
            _atd_bad_json('CodeConfig', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        if self._rfu is not None:
            res['_rfu'] = _atd_write_int(self._rfu)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'CodeConfig':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Intraprocedural:
    """Original type: analysis_type = [ ... | Intraprocedural | ... ]"""

    @property
    def kind(self) -> str:
        """Name of the class representing this variant."""
        return 'Intraprocedural'

    @staticmethod
    def to_json() -> Any:
        return 'Intraprocedural'

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Interprocedural:
    """Original type: analysis_type = [ ... | Interprocedural | ... ]"""

    @property
    def kind(self) -> str:
        """Name of the class representing this variant."""
        return 'Interprocedural'

    @staticmethod
    def to_json() -> Any:
        return 'Interprocedural'

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Interfile:
    """Original type: analysis_type = [ ... | Interfile | ... ]"""

    @property
    def kind(self) -> str:
        """Name of the class representing this variant."""
        return 'Interfile'

    @staticmethod
    def to_json() -> Any:
        return 'Interfile'

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class AnalysisType:
    """Original type: analysis_type = [ ... ]"""

    value: Union[Intraprocedural, Interprocedural, Interfile]

    @property
    def kind(self) -> str:
        """Name of the class representing this variant."""
        return self.value.kind

    @classmethod
    def from_json(cls, x: Any) -> 'AnalysisType':
        if isinstance(x, str):
            if x == 'Intraprocedural':
                return cls(Intraprocedural())
            if x == 'Interprocedural':
                return cls(Interprocedural())
            if x == 'Interfile':
                return cls(Interfile())
            _atd_bad_json('AnalysisType', x)
        _atd_bad_json('AnalysisType', x)

    def to_json(self) -> Any:
        return self.value.to_json()

    @classmethod
    def from_json_string(cls, x: str) -> 'AnalysisType':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class EngineConfig:
    """Original type: engine_config = { ... }"""

    analysis_type: AnalysisType
    pro_langs: bool
    code_config: Optional[CodeConfig] = None
    secrets_config: Optional[SecretsConfig] = None
    supply_chain_config: Optional[SupplyChainConfig] = None

    @classmethod
    def from_json(cls, x: Any) -> 'EngineConfig':
        if isinstance(x, dict):
            return cls(
                analysis_type=AnalysisType.from_json(x['analysis_type']) if 'analysis_type' in x else _atd_missing_json_field('EngineConfig', 'analysis_type'),
                pro_langs=_atd_read_bool(x['pro_langs']) if 'pro_langs' in x else _atd_missing_json_field('EngineConfig', 'pro_langs'),
                code_config=CodeConfig.from_json(x['code_config']) if 'code_config' in x else None,
                secrets_config=SecretsConfig.from_json(x['secrets_config']) if 'secrets_config' in x else None,
                supply_chain_config=SupplyChainConfig.from_json(x['supply_chain_config']) if 'supply_chain_config' in x else None,
            )
        else:
            _atd_bad_json('EngineConfig', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        res['analysis_type'] = (lambda x: x.to_json())(self.analysis_type)
        res['pro_langs'] = _atd_write_bool(self.pro_langs)
        if self.code_config is not None:
            res['code_config'] = (lambda x: x.to_json())(self.code_config)
        if self.secrets_config is not None:
            res['secrets_config'] = (lambda x: x.to_json())(self.secrets_config)
        if self.supply_chain_config is not None:
            res['supply_chain_config'] = (lambda x: x.to_json())(self.supply_chain_config)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'EngineConfig':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Misc:
    """Original type: misc = { ... }"""

    features: List[str]
    proFeatures: Optional[ProFeatures] = None
    numFindings: Optional[int] = None
    numFindingsByProduct: Optional[List[Tuple[str, int]]] = None
    numIgnored: Optional[int] = None
    ruleHashesWithFindings: Optional[List[Tuple[str, int]]] = None
    engineRequested: str = field(default_factory=lambda: 'OSS')
    engineConfig: Optional[EngineConfig] = None
    interfileLanguagesUsed: Optional[List[str]] = None

    @classmethod
    def from_json(cls, x: Any) -> 'Misc':
        if isinstance(x, dict):
            return cls(
                features=_atd_read_list(_atd_read_string)(x['features']) if 'features' in x else _atd_missing_json_field('Misc', 'features'),
                proFeatures=ProFeatures.from_json(x['proFeatures']) if 'proFeatures' in x else None,
                numFindings=_atd_read_int(x['numFindings']) if 'numFindings' in x else None,
                numFindingsByProduct=_atd_read_assoc_object_into_list(_atd_read_int)(x['numFindingsByProduct']) if 'numFindingsByProduct' in x else None,
                numIgnored=_atd_read_int(x['numIgnored']) if 'numIgnored' in x else None,
                ruleHashesWithFindings=_atd_read_assoc_object_into_list(_atd_read_int)(x['ruleHashesWithFindings']) if 'ruleHashesWithFindings' in x else None,
                engineRequested=_atd_read_string(x['engineRequested']) if 'engineRequested' in x else 'OSS',
                engineConfig=EngineConfig.from_json(x['engineConfig']) if 'engineConfig' in x else None,
                interfileLanguagesUsed=_atd_read_list(_atd_read_string)(x['interfileLanguagesUsed']) if 'interfileLanguagesUsed' in x else None,
            )
        else:
            _atd_bad_json('Misc', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        res['features'] = _atd_write_list(_atd_write_string)(self.features)
        if self.proFeatures is not None:
            res['proFeatures'] = (lambda x: x.to_json())(self.proFeatures)
        if self.numFindings is not None:
            res['numFindings'] = _atd_write_int(self.numFindings)
        if self.numFindingsByProduct is not None:
            res['numFindingsByProduct'] = _atd_write_assoc_list_to_object(_atd_write_int)(self.numFindingsByProduct)
        if self.numIgnored is not None:
            res['numIgnored'] = _atd_write_int(self.numIgnored)
        if self.ruleHashesWithFindings is not None:
            res['ruleHashesWithFindings'] = _atd_write_assoc_list_to_object(_atd_write_int)(self.ruleHashesWithFindings)
        res['engineRequested'] = _atd_write_string(self.engineRequested)
        if self.engineConfig is not None:
            res['engineConfig'] = (lambda x: x.to_json())(self.engineConfig)
        if self.interfileLanguagesUsed is not None:
            res['interfileLanguagesUsed'] = _atd_write_list(_atd_write_string)(self.interfileLanguagesUsed)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'Misc':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Extension:
    """Original type: extension = { ... }"""

    machineId: Optional[str] = None
    isNewAppInstall: Optional[bool] = None
    sessionId: Optional[str] = None
    version: Optional[str] = None
    ty: Optional[str] = None

    @classmethod
    def from_json(cls, x: Any) -> 'Extension':
        if isinstance(x, dict):
            return cls(
                machineId=_atd_read_string(x['machineId']) if 'machineId' in x else None,
                isNewAppInstall=_atd_read_bool(x['isNewAppInstall']) if 'isNewAppInstall' in x else None,
                sessionId=_atd_read_string(x['sessionId']) if 'sessionId' in x else None,
                version=_atd_read_string(x['version']) if 'version' in x else None,
                ty=_atd_read_string(x['ty']) if 'ty' in x else None,
            )
        else:
            _atd_bad_json('Extension', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        if self.machineId is not None:
            res['machineId'] = _atd_write_string(self.machineId)
        if self.isNewAppInstall is not None:
            res['isNewAppInstall'] = _atd_write_bool(self.isNewAppInstall)
        if self.sessionId is not None:
            res['sessionId'] = _atd_write_string(self.sessionId)
        if self.version is not None:
            res['version'] = _atd_write_string(self.version)
        if self.ty is not None:
            res['ty'] = _atd_write_string(self.ty)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'Extension':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Error:
    """Original type: error"""

    value: str

    @classmethod
    def from_json(cls, x: Any) -> 'Error':
        return cls(_atd_read_string(x))

    def to_json(self) -> Any:
        return _atd_write_string(self.value)

    @classmethod
    def from_json_string(cls, x: str) -> 'Error':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Errors:
    """Original type: errors = { ... }"""

    returnCode: Optional[int] = None
    errors: Optional[List[Error]] = None

    @classmethod
    def from_json(cls, x: Any) -> 'Errors':
        if isinstance(x, dict):
            return cls(
                returnCode=_atd_read_int(x['returnCode']) if 'returnCode' in x else None,
                errors=_atd_read_list(Error.from_json)(x['errors']) if 'errors' in x else None,
            )
        else:
            _atd_bad_json('Errors', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        if self.returnCode is not None:
            res['returnCode'] = _atd_write_int(self.returnCode)
        if self.errors is not None:
            res['errors'] = _atd_write_list((lambda x: x.to_json()))(self.errors)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'Errors':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Environment:
    """Original type: environment = { ... }"""

    version: str
    os: str
    isJS: bool
    projectHash: Optional[Sha256]
    configNamesHash: Sha256
    ci: Optional[str]
    rulesHash: Optional[Sha256] = None
    isDiffScan: bool = field(default_factory=lambda: False)
    integrationName: Optional[str] = None
    isAuthenticated: bool = field(default_factory=lambda: False)

    @classmethod
    def from_json(cls, x: Any) -> 'Environment':
        if isinstance(x, dict):
            return cls(
                version=_atd_read_string(x['version']) if 'version' in x else _atd_missing_json_field('Environment', 'version'),
                os=_atd_read_string(x['os']) if 'os' in x else _atd_missing_json_field('Environment', 'os'),
                isJS=_atd_read_bool(x['isJS']) if 'isJS' in x else _atd_missing_json_field('Environment', 'isJS'),
                projectHash=_atd_read_nullable(Sha256.from_json)(x['projectHash']) if 'projectHash' in x else _atd_missing_json_field('Environment', 'projectHash'),
                configNamesHash=Sha256.from_json(x['configNamesHash']) if 'configNamesHash' in x else _atd_missing_json_field('Environment', 'configNamesHash'),
                ci=_atd_read_nullable(_atd_read_string)(x['ci']) if 'ci' in x else _atd_missing_json_field('Environment', 'ci'),
                rulesHash=Sha256.from_json(x['rulesHash']) if 'rulesHash' in x else None,
                isDiffScan=_atd_read_bool(x['isDiffScan']) if 'isDiffScan' in x else False,
                integrationName=_atd_read_string(x['integrationName']) if 'integrationName' in x else None,
                isAuthenticated=_atd_read_bool(x['isAuthenticated']) if 'isAuthenticated' in x else False,
            )
        else:
            _atd_bad_json('Environment', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        res['version'] = _atd_write_string(self.version)
        res['os'] = _atd_write_string(self.os)
        res['isJS'] = _atd_write_bool(self.isJS)
        res['projectHash'] = _atd_write_nullable((lambda x: x.to_json()))(self.projectHash)
        res['configNamesHash'] = (lambda x: x.to_json())(self.configNamesHash)
        res['ci'] = _atd_write_nullable(_atd_write_string)(self.ci)
        if self.rulesHash is not None:
            res['rulesHash'] = (lambda x: x.to_json())(self.rulesHash)
        res['isDiffScan'] = _atd_write_bool(self.isDiffScan)
        if self.integrationName is not None:
            res['integrationName'] = _atd_write_string(self.integrationName)
        res['isAuthenticated'] = _atd_write_bool(self.isAuthenticated)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'Environment':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Datetime:
    """Original type: datetime"""

    value: str

    @classmethod
    def from_json(cls, x: Any) -> 'Datetime':
        return cls(_atd_read_string(x))

    def to_json(self) -> Any:
        return _atd_write_string(self.value)

    @classmethod
    def from_json_string(cls, x: str) -> 'Datetime':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Payload:
    """Original type: payload = { ... }"""

    event_id: Uuid
    anonymous_user_id: str
    started_at: Datetime
    sent_at: Datetime
    environment: Environment
    performance: Performance
    extension: Extension
    errors: Errors
    value: Misc
    parse_rate: List[Tuple[str, ParseStat]] = field(default_factory=lambda: [])

    @classmethod
    def from_json(cls, x: Any) -> 'Payload':
        if isinstance(x, dict):
            return cls(
                event_id=Uuid.from_json(x['event_id']) if 'event_id' in x else _atd_missing_json_field('Payload', 'event_id'),
                anonymous_user_id=_atd_read_string(x['anonymous_user_id']) if 'anonymous_user_id' in x else _atd_missing_json_field('Payload', 'anonymous_user_id'),
                started_at=Datetime.from_json(x['started_at']) if 'started_at' in x else _atd_missing_json_field('Payload', 'started_at'),
                sent_at=Datetime.from_json(x['sent_at']) if 'sent_at' in x else _atd_missing_json_field('Payload', 'sent_at'),
                environment=Environment.from_json(x['environment']) if 'environment' in x else _atd_missing_json_field('Payload', 'environment'),
                performance=Performance.from_json(x['performance']) if 'performance' in x else _atd_missing_json_field('Payload', 'performance'),
                extension=Extension.from_json(x['extension']) if 'extension' in x else _atd_missing_json_field('Payload', 'extension'),
                errors=Errors.from_json(x['errors']) if 'errors' in x else _atd_missing_json_field('Payload', 'errors'),
                value=Misc.from_json(x['value']) if 'value' in x else _atd_missing_json_field('Payload', 'value'),
                parse_rate=_atd_read_assoc_object_into_list(ParseStat.from_json)(x['parse_rate']) if 'parse_rate' in x else [],
            )
        else:
            _atd_bad_json('Payload', x)

    def to_json(self) -> Any:
        res: Dict[str, Any] = {}
        res['event_id'] = (lambda x: x.to_json())(self.event_id)
        res['anonymous_user_id'] = _atd_write_string(self.anonymous_user_id)
        res['started_at'] = (lambda x: x.to_json())(self.started_at)
        res['sent_at'] = (lambda x: x.to_json())(self.sent_at)
        res['environment'] = (lambda x: x.to_json())(self.environment)
        res['performance'] = (lambda x: x.to_json())(self.performance)
        res['extension'] = (lambda x: x.to_json())(self.extension)
        res['errors'] = (lambda x: x.to_json())(self.errors)
        res['value'] = (lambda x: x.to_json())(self.value)
        res['parse_rate'] = _atd_write_assoc_list_to_object((lambda x: x.to_json()))(self.parse_rate)
        return res

    @classmethod
    def from_json_string(cls, x: str) -> 'Payload':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)


@dataclass
class Lang:
    """Original type: lang"""

    value: str

    @classmethod
    def from_json(cls, x: Any) -> 'Lang':
        return cls(_atd_read_string(x))

    def to_json(self) -> Any:
        return _atd_write_string(self.value)

    @classmethod
    def from_json_string(cls, x: str) -> 'Lang':
        return cls.from_json(json.loads(x))

    def to_json_string(self, **kw: Any) -> str:
        return json.dumps(self.to_json(), **kw)
